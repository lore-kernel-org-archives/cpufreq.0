From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/2] longhaul: Mark it as dangerous in Kconfig
Date: Sun, 8 Jun 2014 20:02:05 -0400
Message-ID: <20140609000205.GA15035@redhat.com>
References: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>

On Mon, Jun 09, 2014 at 12:20:42AM +0100, Ben Hutchings wrote:
 > longhaul quickly caused hard lockups and possibly killed the memory
 > module on my EPIA-PD board.  It is commented as:
 > 
 > 'BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*'

that last part may have been overly dramatic. When I was originally
writing this driver I was using pre-production cpu's which were
marginal to begin with. Production hw should have been more tolerant.
What didn't help was a lot of the EPIAs were made with *Really*
shitty capacitors that would pop open and ooze over the boards. Might want
to eyeball those, you can usually tell when they've gone bad.

 > Let's put another warning where people are more likely to see it.

That said, I'm not against itbeing marked BROKEN (I thought it
already was), and certainly don't recommend distros enabling it.

I'd also not stand in the way of someone throwing it out completely
given the small amount of systems out there likely still running this.

	Dave

