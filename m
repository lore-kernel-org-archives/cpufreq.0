From: Thomas Renninger <trenn@suse.de>
Subject: Re: desperately trying to enable maximum supported frequency scaling on a core2
Date: Wed, 16 Feb 2011 09:49:31 +0100
Message-ID: <201102160949.31703.trenn@suse.de>
References: <N1B-mrB4sgbovA@Safe-mail.net> <201102160943.07052.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201102160943.07052.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jhopper@safe-mail.net
Cc: cpufreq@vger.kernel.org

On Wednesday, February 16, 2011 09:43:06 AM Thomas Renninger wrote:
> This is the highest frequency exported from BIOS through ACPI
> tables, that's the max OS can set/request:
> # cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq 
> 3200000
Eh, I expect this one does not support turbo mode and 3.2 seem
really to be max supported freq by this processor.

   Thomas
