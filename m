From: "Doug Smythies" <dsmythies@telus.net>
Subject: RE: cpufreq doesn't work quite on Dell GX520 with Pentium D at 2.80gHz
Date: Thu, 17 Sep 2015 20:24:46 -0700
Message-ID: <001201d0f1c1$92476900$b6d63b00$@net>
References: <CACs6S=huh52Q6N4t=1bOzfz+ZRMk5p1jy-STHDDr8K32KRVGcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CACs6S=huh52Q6N4t=1bOzfz+ZRMk5p1jy-STHDDr8K32KRVGcQ@mail.gmail.com>
Content-Language: en-ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=telus.net; s=neo;
	t=1442546691; bh=gQ+NZa0eCS+c5AS9EgoKfZcLlZEShZJTWDNlkxSAZFA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=ju0+lLAFoU+5rFTvXZbYBS9bbgAnJ1jA5Uvvf6975Yrge9PhKG+ymydDStKGkmhVA
	 D5olyj64F89UjiP3ELZPiU2EBOAFLghO9xXfaUrwx4Xs7HdEOiagVVdr0XNVz4/PDv
	 Thl9RrG4u/0ddFqwdNEG9N4HGKRZPHQD6I+pBnfJswvoUGJA1SEZGEt5kmYySsSk3r
	 IwlNGuTzI01SF/nfAdwtPmh85+KppIaysl4GVIQ7CP2zEr/YEQMb4apQBVd2gRDlFn
	 gLyswRRU+QLRjnPQGT8bkherBtwVRzfZEnHI3AJ1ky+xOYiGm/MvgrXHrYUplohEm+
	 Q8ZmFTwrhMZeA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Deirdre Kylie' <kylie.deirdre@gmail.com>
Cc: cpufreq@vger.kernel.org

On 2015.09.17 12:24 Deirdre Kylie wrote:

> Here is the results after "apt-get"-ing it and running cpufreq-info
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ...
> Preparing to unpack .../cpufrequtils_008-1_amd64.deb ...
> Unpacking cpufrequtils (008-1) ...
> Processing triggers for man-db (2.6.7.1-1ubuntu1) ...
> Processing triggers for ureadahead (0.100.0-16) ...
> ureadahead will be reprofiled on next reboot
> Setting up libcpufreq0 (008-1) ...
> Setting up cpufrequtils (008-1) ...
>  * Loading cpufreq kernel modules...          [fail]
>  * CPUFreq Utilities: Setting ondemand CPUFreq governor...
>          * disabled, governor not available...
>           [ OK ]
> Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
> Processing triggers for ureadahead (0.100.0-16) ...
> root@deeDell:/home/dee# cpufreq-info
> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>  no or unknown cpufreq driver is active on this CPU
>  maximum transition latency: 4294.55 ms.
> analyzing CPU 1:
>  no or unknown cpufreq driver is active on this CPU
>  maximum transition latency: 4294.55 ms.

It sounds as though you do not have any frequency scaling driver,
which might be a due to a BIOS setting (I don't know),
and so no you shouldn't try to use cpufrequtils.

Here is a way to check (there may be better ways):

First there is a scaling driver:

doug@s15:~/temp$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver
intel_pstate
intel_pstate
intel_pstate
intel_pstate
intel_pstate
intel_pstate
intel_pstate
intel_pstate
doug@s15:~/temp$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
powersave
powersave
powersave
powersave
powersave
powersave
powersave
powersave

Second there is not a scaling driver:

doug@doug-64:~$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver
cat: /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver: No such file or directory

In the latter case the CPU frequency is fixed and is always the same:

doug@doug-64:~$ grep MHz /proc/cpuinfo
cpu MHz         : 3391.586
cpu MHz         : 3391.586



