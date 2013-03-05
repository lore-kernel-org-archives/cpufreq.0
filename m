From: Guru Prasad <gurupras@buffalo.edu>
Subject: Dynamic cpufreq_frequency_table?
Date: Tue, 5 Mar 2013 11:15:39 -0500
Message-ID: <CAMefCkB4LVnReZmEc65qddNiW17gzVXiTWdN=uaFm5v2aycxcQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
         :subject:from:to:content-type;
        bh=VTFcOgvzwn2U/il3wVFV7At4fPbwJcDNopQrspI9rxU=;
        b=t2khj+F+xUav5N8HaIzp7BZaUIYWV00QLXSL4L/kP0nTYI/UfG0j308vUIpx77u3ng
         wWUVwcwkdEpp48zqz7PMV45UEaUyKA3HxUZaNubeQpSR+2bh4IHkDsdAC92NOZSBtyWl
         azKVWIXr/vL/ybomwwvOcBVUhvdez30z2FLUjjirby5FWx81gsdVlM3g1MLdStmopYX+
         RiaW7HLutMulYlxdDqJtk18smilRS+Yw6QcaJmiMX1YDN/EXSSNIr+sRNgVMxfAopwCb
         qfy7PLi1zU+uaV0ZmTzuA7xIKSUu99HEC/a81o7KnCPT0NLVv04+Gjs+wmx9ar2nqIzu
         dYPA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,
I'm trying to run the Linux kernel with the cpufreq driver in a
simulation environment where the CPU frequency can be modified.

This leaves me with two choices :
Either have several kernels with different static cpufreq_frequency tables or
let the kernel create the cpufreq_frequency_table dynamically.

Is it possible to create a cpufreq_frequency_table dynamically and
initialize a driver with this?

I'm running version 2.6.35.8
