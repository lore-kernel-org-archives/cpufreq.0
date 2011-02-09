From: Thomas Renninger <trenn@suse.de>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Wed, 9 Feb 2011 20:37:20 +0100
Message-ID: <201102092037.21028.trenn@suse.de>
References: <4D4DAB6A.6090807@gmail.com> <4D509E13.6090308@reinelt.co.at> <4D52E832.9050803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4D52E832.9050803@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: Michael Reinelt <michael@reinelt.co.at>, Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

On Wednesday 09 February 2011 20:17:06 J Webster wrote:
> I have partially solved this by turning off speedstep in the BIOS.
> Now the computer runs at 1.73 permanently.
> Is there a way to get cpufreqd to control the speed after that and flip 
> between 800 and 1.73 as needed or is that a function completely 
> controlled by the BIOS?
> ie now that I have max speed, I guess I have to leave it on max?

You might want to use processor.ignore_ppc then.
It ignores BIOS events telling the OS to limit the frequency.

    Thomas
