From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: [PATCH 1/2] longhaul: Mark it as dangerous in Kconfig
Date: Mon, 09 Jun 2014 19:05:25 +0100
Message-ID: <5395F765.90405@interia.pl>
References: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk> <20140609000205.GA15035@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20140609000205.GA15035@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1402337136;
	bh=hPfLXzwyF6xPRI2sll+a75iQUnK8zu7OD0OhJi6u430=;
	h=Received:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	 CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Interia-Antivirus;
	b=CpLoFaDkrSaNdTwpAuhPBZIiEBs3F9nqM4SgZc/k23FsUy5D+37P6rj7a5MeXbC4F
	 8doXdGFYElSBPbgl5bISPS1mlyEZ7bQzk8DQigDX0RUMloG7OPc5o2ZJPpRRovk+a4
	 Gq8sVlwMcQjev/90D2JBuGwXcQbhExzvTnPMW+HA=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Dave Jones <davej@redhat.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org

W dniu 09.06.2014 01:02, Dave Jones pisze:
> On Mon, Jun 09, 2014 at 12:20:42AM +0100, Ben Hutchings wrote:
>   > longhaul quickly caused hard lockups and possibly killed the memo=
ry
>   > module on my EPIA-PD board.  It is commented as:
>   >
>   > 'BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*'
>
> that last part may have been overly dramatic. When I was originally
> writing this driver I was using pre-production cpu's which were
> marginal to begin with. Production hw should have been more tolerant.
> What didn't help was a lot of the EPIAs were made with *Really*
> shitty capacitors that would pop open and ooze over the boards. Might=
 want
> to eyeball those, you can usually tell when they've gone bad.
>
>   > Let's put another warning where people are more likely to see it.
>
> That said, I'm not against itbeing marked BROKEN (I thought it
> already was), and certainly don't recommend distros enabling it.
>
> I'd also not stand in the way of someone throwing it out completely
> given the small amount of systems out there likely still running this=
=2E
>
> 	Dave
>
>
If I may I would like to agree with Dave Jones. There is no point
in changing text which nobody will see in their logs. If somebody
wants to use the driver it is very easy now to compile module outside
the kernel tree. I didn't expected possibility of hardware damage
because driver just puts CPU to sleep to change frequency, but
VIA products have been full of bugs so looks like anything is
possible. Another matter is we have got these "dynamic ticks" in kernel
now and code in driver expects monotonic ticks and abuses them a bit
in order to be able to wake CPU from sleep. Does it make it obsolete?

Rafa=C5=82 Bilski

