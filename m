From: Lei Yu <y.benben.y@gmail.com>
Subject: Question: cpufreq_stats is not available in sysfs
Date: Thu, 3 Nov 2011 11:55:23 -0700
Message-ID: <CAHqxzWxXPCkn_qzbOsZ_=ziafjRNUYTPOnVYgnOGa7+E_26Zpg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=OfTPZGCx7N9VyE3aqFGLix5VHeOU107yNWG+W5exdS0=;
        b=a/vqZcMJjKYyG3iSxJbw61Vy/Kx+bffyc6oD7er+c77hqv89Lq2uJjIVjpbupzGfwX
         WZoelvbSuhcNADH9BqPdlIRlg5XIPAV/uQRs//cOU7hgEjI4VwmHafLWd3wzxp1nfBEc
         YdhfNYBAfNfkC6imNShZMXxglZuBkdGCkYkn8=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,
   I tried to use cpufreq_stats to do some performance anlaysis but I
did not see cpufreq_stats entries under sysfs on my Linux machine. I
am wondering if anyone can help me point out what could be the
problem.
   Here are more detailed info
      1). My kernel version is: 3.0.1
      2). cpufreq and cpufreq_stats has been built into the kernel
image rather than as a separate, standalone kernel modules.
      3). I can see cpufreq related sysfs entries under:
/sys/devices/system/cpu/cpufreq and
/sys/devices/system/cpu/cpu0/cpufreq.
      4). But when I looked under above two directories, I did not
see cpufreq_stats related entries.
   Also, when I looked at the code of the cpufreq_stats.c, I see the
logics like this:
      --> cpufreq_stats sysfs is only created inside
cpufreq_stats_create_table()
      --> cpufreq_stats_create_table() is either invoked inside
cpufreq_stat_notifier_policy() or cpufreq_stats_create_table_cpu().
      --> cpufreq_stats_create_table_cpu() is only invoked if a CPU
is CPU_DOWN_FAILED or CPU_DOWN_FAILED_FROZEN which will not happen in
my environment.
      --> And, cpufreq_stats_init() will unregister
CPUFREQ_POLICY_NOTIFIER if registering of CPUFREQ_TRANSITION_NOTIFIER
is successful.
      So, cpufreq_stats sysfs entries will not exist? I am sure I
have mis-read the code somehow.

Really appreciate your help.

Lei Yu

P.S. I am new to Linux kernel mailing list, if I am not following any
of the style, pls do let me know.
