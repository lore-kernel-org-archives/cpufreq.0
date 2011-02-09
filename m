From: Thomas Renninger <trenn@suse.de>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Wed, 9 Feb 2011 20:50:40 +0100
Message-ID: <201102092050.41398.trenn@suse.de>
References: <4D4DAB6A.6090807@gmail.com> <201102092037.21028.trenn@suse.de> <4D52EE58.4010206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4D52EE58.4010206@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: Michael Reinelt <michael@reinelt.co.at>, Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

On Wednesday 09 February 2011 20:43:20 J Webster wrote:
> Tried that but it didn;t ignore the BIOS. Either that or something
> else is limiting it.
> That's why I had to turn speedstep off in the BIOS.

Interesting, that would mean the BIOS additionally sets some HW
registers to limit things or processor.ignore_ppc is broken for you,
but as it works for others, I can't see why...

Is /sys/devices/.../bios_limit still showing lower values?
This should not be possible anymore with this param.
Then better double check that you've written the parameter correctly
or also try a latest vanilla kernel if not done yet.

       Thomas
