From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: [BUG?] Moving drivers to drivers/cpufreq/ causes all to be loaded
Date: Sun, 14 Aug 2011 19:17:18 +0200
Message-ID: <CAPXgP102fk_7WPUY1QKq9izJuWH4saGeCVmYO5tJCReegTAEkA@mail.gmail.com>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk> <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
 <201104261605.26791.arnd@arndb.de> <201104261904.45923.rjw@sisk.pl>
 <20110426181508.GB1908@redhat.com> <20110813154638.GA1494@elie.gateway.2wire.net>
 <20110813190246.GA10412@elie.gateway.2wire.net> <20110813211142.GA1536@redhat.com>
 <20110814170124.GC12747@elie.gateway.2wire.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=4kVYam04wTy/O+2R8PCyxD0/2xS1Tb6XxJ/8KwCmS00=;
        b=b7Gl0vjeOaZRXMvSfFkkXFJoOF2mGBbk0mGZt/gun4nAHQ4d32aiFVl8nXVV1N1c6S
         6KcEH++F+kiPGbDhSn/qYzwnlgqVfYWvNgebER/9s+1yAOKew094HSyjxYlfVz9nF4Er
         ZXnLPvgjNQjjaNQoMM+ZJZd/AFGUdaV0MaedU=
In-Reply-To: <20110814170124.GC12747@elie.gateway.2wire.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Mattia Dongili <malattia@debian.org>

On Sun, Aug 14, 2011 at 19:01, Jonathan Nieder <jrnieder@gmail.com> wro=
te:
> (-cc: ARM/etc people; +cc: Kay)
>
> Dave Jones wrote:
>
>> If we have to move stuff again, we could do drivers/cpufreq/x86/ etc=
=2E.
>
> Unfortunately the old script used "find", not "ls", so that wouldn't
> work. :/
>
>> What we used to do in Fedora grew more and more complex over time.
>> Here's the last incarnation: http://fpaste.org/uvDb/
>
> The main difference from Debian seems to be that this script loads th=
e
> module corresponding to the chosen governor, while Debian's init
> script loads all governor modules early (using a heuristic I would
> like to avoid that involves running "find" to list them) and chooses
> the governor to use later.

Right, loading cpufreq drivers from userspace is fragile, and can not
properly work today. Only the kernel itself know which driver to try
to bind in which order. Modular cpufreq kernel modules make no real
sense here with the infrastructure we have available today.

>> In an ideal world, we'd auto-load the right module on a hotplug even=
t
>> from a cpu, but we're not there yet. I believe Kay is working on tha=
t.
>
> Yes, that is what I was hoping for. =C2=A0Are there patches to test?

Yeah, it's on the TODO list, I just get too many 'really broken'
things get sorted on top all time. :) But it will happen in the next
months.

> The comment at
> http://thread.gmane.org/gmane.linux.kernel/796450/focus=3D796874 also
> looks promising.

That could work, but we better go right for the CPU specific aliases
and do not try to load all of them, even when for completely different
systems. That would just encode another workaround into kernel
modules, which we better solve properly.

Kay
