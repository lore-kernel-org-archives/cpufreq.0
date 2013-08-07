From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: support for software direct frequency throttling?
Date: Thu, 08 Aug 2013 01:37:07 +0200
Message-ID: <2466745.skqnolQonv@vostro.rjw.lan>
References: <5202A24F.6040506@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5202A24F.6040506@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Wednesday, August 07, 2013 02:38:55 PM Mark Langsdorf wrote:
> Is there an easy way to dynamically limit the maximum or minimum
> frequencies available to a governor? I'm trying to support frequency
> throttling in response to a thermal event (or theoretically to allow a
> BMC to set a minimum frequency regardless of current load).
> 
> I looked into doing this last year and it required some QoS patches that
> I don't think ever made it into the kernel.
> 
> Is there a straightforward way to do this right now?

Have you looked at drivers/thermal/cpu_cooling.c ?

Rafael

