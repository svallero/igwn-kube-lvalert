FROM containers.ligo.org/lscsoft/gracedb:docker

ENV LVALERT_SERVER dummy
ENV LVALERT_USER dummy
ENV LVALERT_PASSWORD dummy

ADD add_nodes.template /root/
ADD entrypoint /root/entrypoint
RUN chmod +x /root/entrypoint

WORKDIR /root
USER root
#CMD ["python", "add_nodes.py"]
ENTRYPOINT ["/root/entrypoint"]
