package rookie;

public class list<E> implements func<E> {
    private int size;
    private Node<E> head;

    public static class Node<E> {
        private E data;
        private Node<E> next;

        public Node(E data) {
            this.data = data;
        }
    }

    public list() {
        this.size = 0;
        this.head = null;
    }

    @Override
    public Integer size() {
        return this.size();
    }

    @Override
    public Boolean IsEmpty() {
        return this.size == 0;
    }

    @Override
    public Boolean add(E element) {
        Node<E> newnode;
        try {
            newnode = new Node<E>(element);
        } catch (OutOfMemoryError e) {
            throw new OutOfMemoryError("Failed to allocate memory for new node.");
        }
        if (this.head == null) {
            this.head = newnode;
        } else {
            Node<E> cur = head;
            while (cur.next != null) {
                cur = cur.next;
            }
            cur.next = newnode;
        }
        this.size++;
        return true;
    }

    @Override
    public E frist() {
        if (this.head == null) {
            throw new NullPointerException("The list is empty.");
        }
        return this.head.data;
    }

    @Override
    public E back() {
        if (head == null) {
            throw new NullPointerException("The list is empty.");
        }
        return this.head.data;
    }

    @Override
    public E get(Integer index) {
        if (index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException("index " + index + " is out of bounds");
        }
        Node<E> cur = head;
        for (int i = 0; i < index; i++) {
            cur = cur.next;
        }
        return cur.data;
    }

    @Override
    public E remove(Integer index) {
        if (index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException("index " + index + " is out of bounds");
        }
        E removedata;
        Node<E> cur = head;
        if (index.equals(0)) {
            removedata = cur.data;
            head = head.next;
            size--;
            return removedata;
        }
        for (int i = 0; i < index - 1; i++) {
            cur = cur.next;
        }
        removedata = cur.next.data;
        cur.next = cur.next.next;
        size--;
        return removedata;
    }

    @Override
    public void clear() {
        size = 0;
        head = null;
    }

    @Override
    public Boolean contains(E element) {
        Node<E> cur = head;
        while (cur != null) {
            if (cur.data.equals(element)) {
                return true;
            }
            cur = cur.next;
        }
        return false;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        Node<E> cur = head;
        builder.append('[');
        while (cur != null) {
            builder.append(cur.data);
            builder.append(" ");
            cur = cur.next;
        }
        builder.append(']');
        return builder.toString();
    }
}
