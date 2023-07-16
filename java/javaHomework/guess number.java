import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.util.Random;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Main {
    private static final int MAX_GUESS_COUNT = 10; // 最大猜测次数

    private JFrame frame;
    private JPanel panel;
    private JLabel label;
    private JTextField textField;
    private JButton button;
    private Random random;
    private int answer;
    private int guessCount;

    public Main() {
        frame = new JFrame("猜数字游戏");
        panel = new JPanel();
        label = new JLabel();
        textField = new JTextField(10);
        button = new JButton("猜一下");

        panel.add(label);
        panel.add(textField);
        panel.add(button);

        frame.add(panel, BorderLayout.CENTER);
        frame.pack();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

        random = new Random();
        answer = random.nextInt(101);
        guessCount = 0;

        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String text = textField.getText();
                int guess = Integer.parseInt(text);

                if (guess == answer) {
                    label.setText("恭喜你，猜对了！");
                    button.setEnabled(false);
                } else if (guess < answer) {
                    label.setText("猜小了！");
                } else {
                    label.setText("猜大了！");
                }

                guessCount++;

                if (guessCount >= MAX_GUESS_COUNT) {
                    label.setText("很遗憾，您已经猜了" + MAX_GUESS_COUNT + "次，正确答案是" + answer + "，请继续努力！");
                    button.setEnabled(false);
                }
            }
        });
    }

    public static void main(String[] args) {
        new Main();
    }
}
