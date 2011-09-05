From: Thomas Renninger <trenn@suse.de>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD only?)
Date: Mon, 5 Sep 2011 16:41:47 +0200
Message-ID: <201109051641.47688.trenn@suse.de>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com> <20110806142414.GA1440@isilmar-3.linta.de> <20110806143118.GA5717@isilmar-3.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110806143118.GA5717@isilmar-3.linta.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Matt Turner <mattst88@gentoo.org>, cpufreq@vger.kernel.org, Juergen Rose <rose@rz.uni-potsdam.de>

On Saturday, August 06, 2011 04:31:18 PM Dominik Brodowski wrote:
> On Sat, Aug 06, 2011 at 04:24:14PM +0200, Dominik Brodowski wrote:
> > Hey,
> > 
...
> > I tend to add an "-a" option to set all CPUs, though (cpupowerutils only).
> 
> *doh* It is already available:
> 
> $ cpupower -c all frequency-set -g powersave

-c all is default for cpupower *-set commands
and -c 0 is default for all cpupower *-info commands.

   Thomas
