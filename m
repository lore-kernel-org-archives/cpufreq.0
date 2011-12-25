From: "Artem S. Tashkinov" <t.artem@lycos.com>
Subject: cpufreq userspace governor doesn't work for Intel Core 2 Gen 2 CPUs
Date: Sun, 25 Dec 2011 18:36:29 +0000 (GMT)
Message-ID: <388674780.142932.1324838189780.JavaMail.mail@webmail18>
References: <1982761334.142905.1324837801755.JavaMail.mail@webmail18>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: davej@redhat.com, cpufreq@vger.kernel.org

Hello,

On my Intel Core i5 CPU with acpi-cpufreq module loaded I do this

# echo 2000000 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed

then

# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
2000000
2000000
2000000
2000000

so theoretically it should work.

However i7z (http://code.google.com/p/i7z/) shows that CPU frequency is freely floating
and turbo boost gets enabled as soon as I have any discernible load, in other words 
userspace CPU frequency driver doesn't work at all and it doesn't really enforce the specified
CPU frequency.

Best wishes,

Artem
