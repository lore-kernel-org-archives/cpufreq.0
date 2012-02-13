From: J Webster <jw.jwebster@gmail.com>
Subject: speed throttle to 800 cpufreq Ocelot
Date: Mon, 13 Feb 2012 19:11:30 +0000
Message-ID: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=fgRpomI1uNu7xAHVk9E9WGkazfMkitDexJgu9IBYrKE=;
        b=t1p0CLGmD/3ObnGTiFw7NimCpYIugKOUxp1yGU63oU4NDjyM47DkwZYTEj+WDl+Op4
         PgRyF9ZIa4Mi2VUZ4noqzhfYbFRoYkf/rly4iDJ4G36UHXhejC8NCcd1RDKLoCqjziLe
         SH7ZDLPf7T6fuhlG7oy0YR50N2p8eTmwP5SPQ=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

This problem first occurred 1 year ago on Maverick Meerkat.
I just upgraded and now it has appeared again.
I cannot get the indicator-cpufreq to start either.
I added the ignore_ppc =3D 1 to the grub but whilst that fixed it in
Meerkat, it does not in Ocelot.

j@j-Inspiron-9300:~$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to [email]cpufreq@vger.kernel.org[/email], pleas=
e.
analyzing CPU 0:
=A0 driver: p4-clockmod
=A0 CPUs which run at the same hardware frequency: 0
=A0 CPUs which need to have their frequency coordinated by software: 0
=A0 maximum transition latency: 10.00 ms.
=A0 hardware limits: 75.0 MHz - 600 MHz
=A0 available frequency steps: 75.0 MHz, 150 MHz, 225 MHz, 300 MHz, 375
MHz, 450 MHz, 525 MHz, 600 MHz
=A0 available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
=A0 current policy: f[B]requency should be within 75.0 MHz and 600 MHz.=
[/B]
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 The governor "perfo=
rmance" may decide which speed to use
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 within this range.
=A0 current CPU frequency is 600 MHz.
=A0 cpufreq stats: 75.0 MHz:0.00%, 150 MHz:0.00%, 225 MHz:0.00%, 300
MHz:0.00%, 375 MHz:0.00%, 450 MHz:0.00%, 525 MHz:0.00%, 600
MHz:100.00%
(arg: 2)




jason@Inspiron-9300:~$ indicator-cpufreq
Traceback (most recent call last):
=A0 File "/usr/bin/indicator-cpufreq", line 81, in <module>
=A0=A0=A0 ind =3D MyIndicator()
=A0 File "/usr/lib/python2.7/dist-packages/indicator_cpufreq/indicator.=
py",
line 95, in __init__
=A0=A0=A0 self.update_ui()
=A0 File "/usr/lib/python2.7/dist-packages/indicator_cpufreq/indicator.=
py",
line 106, in update_ui
=A0=A0=A0 fmin, fmax, governor =3D cpufreq.get_policy(self.cpus[0])
=A0 File "/usr/lib/python2.7/dist-packages/indicator_cpufreq/cpufreq.py=
",
line 143, in get_policy
=A0=A0=A0 policy =3D (p.contents.min, p.contents.max, p.contents.govern=
or)
ValueError: NULL pointer access


jason@Inspiron-9300:~$ sudo /etc/init.d/cpufrequtils start
=A0* CPUFreq Utilities: Setting ondemand CPUFreq governor...
=A0=A0=A0=A0=A0=A0=A0=A0=A0 * disabled, governor not available...
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [ OK ]
jason@Inspiron-9300:~$
