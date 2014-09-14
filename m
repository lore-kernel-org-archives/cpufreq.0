From: Grant Coady <gcoady.lk@gmail.com>
Subject: cpufreq values displayed 20% high on Intel J1900 BayTrail CPU
Date: Sun, 14 Sep 2014 11:40:14 +1000
Message-ID: <1vr91al704l1gn98hm3rbp34925s2fnpm1@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:organization:message-id:user-agent
         :mime-version:content-type:content-transfer-encoding;
        bh=QL4MptsfeSrrFxdJNyTL+kj6fuAS6P97qkKTQKXRBZY=;
        b=VrFfTi3gUmQeLkS+YUQ6x0/9Kivm9kpuJDQ+nemKQaLeW1OJYjWYGrkfo8tX5qq5Tj
         CCK+88351a0j6TL3ltTRQzopcfjbrLIKa4n0IBxXBMKrLDVE7KxfvjJdALrGtXJeMVdr
         BcVqxcA/wNHnW2lLu8gH5fGGvSYvn0nq+p9c8x7LEfYKC5/RJa5OQAO/t/ZLfqRMXS0a
         Lt0nawPb0Jnwh1q8hfuoBXdxWa8nFEAZwYcG9r0ueaesET3cEmd4OtK84cU9HZ2kLrPG
         JA1feMkQkv7CkK51Si6jdqrvIXHbcFKP2R/STovlzRSir0keiZoP5qqWKLyeSuXkyJp7
         q5qw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hi there,

The J1900 CPU:
<http://ark.intel.com/products/78867/Intel-Celeron-Processor-J1900-2M-Cache-up-to-2_42-GHz>

is supposed to run at 1.33, 1.99 and 2.42 GHz for idle, normal, and boost.

Instead we have:

~$ uname -a
Linux itxmini 3.16.2a #14 SMP Sun Sep 14 11:06:35 EST 2014 x86_64 Intel(R) Celeron(R) CPU  J1900  @ 1.99GHz GenuineIntel GNU/Linux

~$ cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 0.97 ms.
  hardware limits: 1.60 GHz - 2.90 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.60 GHz and 2.90 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
analyzing CPU 1:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 0.97 ms.
  hardware limits: 1.60 GHz - 2.90 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.60 GHz and 2.90 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
analyzing CPU 2:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 0.97 ms.
  hardware limits: 1.60 GHz - 2.90 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.60 GHz and 2.90 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
analyzing CPU 3:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 0.97 ms.
  hardware limits: 1.60 GHz - 2.90 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.60 GHz and 2.90 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.

Where do I go (which file/s) to fix this?

More info:
.config: <http://bugsplatter.id.au/kernel/boxen/itxmini/config-3.16.2a.gz>
dmesg: <http://bugsplatter.id.au/kernel/boxen/itxmini/dmesg-3.16.2a.gz>

Thanks,
Grant.

