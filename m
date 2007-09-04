From: Len Brown <lenb@kernel.org>
Subject: Re: [patch] enable userspace cpu core voltage control with acpi-cpufreq
Date: Tue, 4 Sep 2007 07:49:37 -0400
Message-ID: <200709040749.38319.lenb@kernel.org>
References: <200709021441.l82EfWCe022642@mail.mc.o2online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753885AbXIDLqH@vger.kernel.org>
In-Reply-To: <200709021441.l82EfWCe022642@mail.mc.o2online.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: colin.michael@o2online.de
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernrel.org, cpufreq@www.linux.org.uk

On Sunday 02 September 2007 10:41, colin.michael@o2online.de wrote:

> Hello, 
> i want to make a patch known that provides a userspace interface to control the core voltage of a computer processor(s).
> 
> Some notes about:
> =============================================================
> The current version patches acpi-cpufreq.
> An older version patched speedstep-centrino and also adds additional built-in frequency/voltage tables to the Linux kernel 
> for some Pentium-M CPU models.
> This is particularly usefull for laptops with broken ACPI that can't use the speedstep-centrino cpufreq driver at all.
...
> Project located at: https://www.dedigentoo.org/trac/linux-phc/

Please point me to the unfixed bug reports against Linux/ACPI
that justify the existence of linux-phc and I promise to
do my best to fix them.  If they do not exist today,
then please file them.

I believe that linux-phc is alarmingly dangerous code
and I'm willing to invest my time to make it unnecessary.

thanks,
-Len
