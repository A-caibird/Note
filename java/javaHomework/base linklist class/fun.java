package rookie;

interface func<E> {

    public Integer size();
    public Boolean IsEmpty();
    public Boolean add(E element);
    public E frist();
    public E back();
    public E get(Integer index);
    public E remove(Integer index);
    public void clear();
    public String toString();
    public Boolean contains(E element);
}

