import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.util.Deque;
import java.util.LinkedList;

public class DrawingPanel extends JPanel {
    private Shape currentShape;
    private static Shape previousShape;
    private static Deque<Shape> dat = new LinkedList<>();

    public DrawingPanel() {
        // 构造函数中可以进行一些初始化操作
        // 例如设置窗口大小、添加鼠标事件监听器等
        this.setPreferredSize(new Dimension(500, 500));
        this.addMouseListener((MouseListener) new MouseHandler());
        this.addMouseMotionListener((MouseMotionListener) new MouseHandler());
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        // 绘制当前图形
        if (currentShape != null) {
            Graphics2D g2d = (Graphics2D) g;
            g2d.draw(currentShape);
        }
    }

    public Shape drawCircle(int x, int y, int radius) {
        // 在(x, y)处画半径为radius的圆
        currentShape = new Ellipse2D.Double(x - radius, y - radius, radius * 2, radius * 2);
        previousShape = currentShape;
//        repaint();
        return currentShape;
    }

    public Shape drawLine1() {
        // 在圆所在平面上画与圆相交的直线1
        // 这里只是示例代码，需要根据具体需求修改
        int x1 = 100, y1 = 100, x2 = 400, y2 = 400;
        currentShape = new Line2D.Double(x1, y1, x2, y2);
        previousShape = currentShape;
        repaint();
        return currentShape;
    }

    public Shape drawLine2() {
        // 在圆所在平面上画与圆相交的直线2
        // 这里只是示例代码，需要根据具体需求修改
        int x1 = 100, y1 = 400, x2 = 400, y2 = 100;
        currentShape = new Line2D.Double(x1, y1, x2, y2);
        // 判断当前直线是否与之前的图形重合
        if (previousShape != null && currentShape.intersects(previousShape.getBounds2D())) {
            // 如果重合，则将当前直线向右平移一定距离
            currentShape = new Line2D.Double(x1 + 50, y1, x2 + 50, y2);
        }
        previousShape = currentShape;
        repaint();
        return currentShape;
    }

    public Shape undo() {
        int sz = dat.size();
        Shape temp=dat.getFirst();
        if (sz == 1)
            currentShape = null;
        else {
            System.out.println(dat.size());
            dat.pop();
            currentShape = dat.getLast();
        }
        repaint();
        return  temp;
    }
    public Shape redo(){
        repaint();
        return undo();
    }
    private class MouseHandler extends MouseAdapter {
        public void mousePressed(MouseEvent e) {
            // 在鼠标按下时记录下来坐标
            // 如果需要实现其他鼠标事件的处理，可以在这里添加代码
        }

        public void mouseReleased(MouseEvent e) {
            // 在鼠标松开时进行绘制操作
            // 根据需要调用drawCircle、drawLine1、drawLine2等方法
        }
    }

    public static void main(String[] args) {
        // 在main方法中创建窗口并显示
        DrawingPanel panel = new DrawingPanel();
        JFrame frame = new JFrame("Drawing Panel");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(panel);
        frame.pack();
        frame.setVisible(true);
        Shape temp;


        //生成一个圆,直线,使用deque容器dat存储图形组件
        dat.addFirst(panel.drawCircle(250, 250, 100));
        dat.addFirst(panel.drawLine1());
        panel.undo();
    }
}
