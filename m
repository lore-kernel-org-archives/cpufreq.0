From: Lorenzo Scattolin <lorenzo.scattolin04@gmail.com>
Subject: issues on driver CPU
Date: Sat, 28 Nov 2015 19:22:06 +0100
Message-ID: <5659F0CE.2060701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=cTCTjLbstliD1MA2FpZsHSsQfQ+dAA1kz+dWIGkNWMg=;
        b=bG9Jnsq3QKhvt4W9S0miWo9/NVkTmgkOgmenUdxF9+a+xGQSBIyH3RTyM0c3u4TO0u
         icZJQe0RzqJ6WGjnk86kmJNUA0kZeJ6N97UnCneWUrUhqL9NxuPBCABm4ziUy9SHBC1x
         9eLv1oxQT16X01fPbFCLRmHP1opptp1Le2eCPJC884cJHZ3GYn8oHovqdVf6kpz5a3NQ
         7Ke8m/oZGGoeDWaxvPFj+5vJcB4qG6FzOIYiZFDjxQ/GyFGbnVqVd0WJfGfs9mQZlGDa
         X0Zcf0nj+RL0F6r6XVoPdOxnrXJvge9JRITmuF/eQIAWgDENAIuo4aqqB7SB9EceSnJr
         E6+A==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

What driver control my cpu?
Probably isn't a cpufrequtils issues
Impossible to scale freq...
Thanks 	


$ cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.
analyzing CPU 2:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.
analyzing CPU 3:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.

$ lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux unstable (sid)
Release:	unstable
Codename:	sid


$ lsmod | grep cpu
cpufreq_userspace      16384  0
cpufreq_conservative    16384  0
cpufreq_stats          16384  0
cpufreq_powersave      16384  0
acpi_cpufreq           20480  0
processor              36864  1 acpi_cpufreq


$ uname -a
Linux Bigdebian 4.2.0-1-amd64 #1 SMP Debian 4.2.6-1 (2015-11-10) x86_64
GNU/Linux

$ cat /proc/cpuinfo | grep "model name"
model name	: Intel(R) Core(TM)2 Quad CPU    Q9550  @ 2.83GHz
model name	: Intel(R) Core(TM)2 Quad CPU    Q9550  @ 2.83GHz
model name	: Intel(R) Core(TM)2 Quad CPU    Q9550  @ 2.83GHz
model name	: Intel(R) Core(TM)2 Quad CPU    Q9550  @ 2.83GHz




-- 
Lorenzo S.
