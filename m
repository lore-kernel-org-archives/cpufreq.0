From: chao xie <xiechao.linux@gmail.com>
Subject: cpufreq governor with SMP support
Date: Mon, 5 Dec 2011 18:00:18 +0800
Message-ID: <CAK9wHMTatnwEMKUYjykFzdWJXtoLbBC9fzOfn+gDYS+HMDcbKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=+P6qRIRnpJZ777qDQUGDTuEyrnXoNfQxYUZN5jvVQUk=;
        b=mtR4W+DjM5hzC5re1bAeZwOxmw1EDkm9iqK8loNJTE2yuHiiQ0tMjQs3QJ2+jLTSCI
         rdPBHnHALdjblrEtZLFdloBVKigGfVH5sklx9Me5BqlTiCJtnsXazOaeZHuwFE/G7I3Y
         XZxwOP3AsoZWSeETIQVe8yT/nDY5Iyr/Qe3/8=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: cpufreq@vger.kernel.org, davej@redhat.com

Hi
The CPUFreq ondemand governor will use  deferrable timer for cpu
workload profiling.
The deferrable timer will not invoke the core when the core is totally =
idle.
So for a SMP system, there are two cores, each one will have its own
cpufreq_policy and do the profiling and change the frequency of core.
I find that after system boot up, and I set the governor of the two
cores to be =93ondemand=94. The profiling in CPU1 will never start beca=
use
CPU1 is in idle, and the deferrable timer cpu profiling depends on
will not wake up core.
Is that a problem, or I made mistake about how to set up cpufreq in
the SMP system?
