From: Thomas Renninger <trenn@suse.de>
Subject: Re: Bug or my failor?
Date: Tue, 27 Jul 2010 10:19:32 +0200
Message-ID: <201007271019.32585.trenn@suse.de>
References: <AANLkTikdOuusZ5dA3C=oa6Jps2ewxXnvpOkQBi=PNh9k@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTikdOuusZ5dA3C=oa6Jps2ewxXnvpOkQBi=PNh9k@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrei Mitrofanow <smilebef@googlemail.com>
Cc: cpufreq@vger.kernel.org

On Monday 26 July 2010 21:26:00 Andrei Mitrofanow wrote:
> Daer Mr. Brodovsky,
> 
> My System say:
> 
>  cpufreq-info
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
> analysiere CPU 0:
>   kein oder nicht bestimmbarer cpufreq-Treiber aktiv
>   Maximale Dauer eines Taktfrequenzwechsels: 0.00 ms.
That means that no cpufreq driver could get loaded.

The reason probably is because a bug slipped in recently.
It gets exposed if CONFIG_SMP is not set as in your .config:
# CONFIG_SMP is not set

The bug is fixed in linux-2.6.35-rc6, but the patch also applies for 
2.6.34, I'll send a submit request to stable@kernel.org.
The bug is tracked here:
[Bug 16357] acpi-cpufreq fails to load (No such device) if CONFIG_SMP=n
https://bugzilla.kernel.org/show_bug.cgi?id=16357


    Thomas
