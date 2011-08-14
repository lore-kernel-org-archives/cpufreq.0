From: Mattia Dongili <malattia@gmail.com>
Subject: Re: [BUG?] Moving drivers to drivers/cpufreq/ causes all to be loaded
Date: Sun, 14 Aug 2011 09:18:27 +0900
Message-ID: <20110814001826.GB6432@kamineko.org>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
 <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
 <201104261605.26791.arnd@arndb.de>
 <201104261904.45923.rjw@sisk.pl>
 <20110426181508.GB1908@redhat.com>
 <20110813154638.GA1494@elie.gateway.2wire.net>
 <20110813190246.GA10412@elie.gateway.2wire.net>
 <20110813211142.GA1536@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:x-message-flag
         :x-operating-system:x-editor:x-disclaimer:user-agent;
        bh=smcCI/jJBORnDUboibnzYYybnKfItvCqocuEV5uXPSg=;
        b=IELMLz/RDwUAq74lnphgiYwlv6oyMm4dhleSg4FvHSX1unIIjrRoVijZlmZPZknR2g
         EppEPfPIpI+k05MIet40WvZ0PEpZ7FPyxAbw6Ol8kIbo7yMeXh7zuWDGzgpZg3s4rMiY
         vtsZersE7nz5iVGIRg7Ac0sV+6N6sG7HwuqdY=
Content-Disposition: inline
In-Reply-To: <20110813211142.GA1536@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Jonathan Nieder <jrnieder@gmail.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Nicolas Pitre <nicolas.p>

On Sat, Aug 13, 2011 at 05:11:42PM -0400, Dave Jones wrote:
> On Sat, Aug 13, 2011 at 02:02:46PM -0500, Jonathan Nieder wrote:
>  > Jonathan Nieder wrote:
>  > 
>  > >  (1) This is still incredibly fragile.  What *should* cpufrequtils
>  > >      be doing to get the modules it needs?
>  > >
>  > >  (2) Using the 3.0 or later kernel with old userspace gives bad
>  > >      results (e.g., 30% increase in power consumption for one
>  > >      reporter).  That's a regression.
>  > 
>  > The "30% increase" part was an unrelated bug (i915.i915_enable_rc6=1
>  > brings power consumption back to normal), for those who were
>  > wondering. :)
>  > 
>  > Old userspace automatically loading the wrong cpufreq drivers still
>  > does not seem great to me, though I don't have any great ideas about
>  > how to prevent that (a separate drivers/cpufreq-drivers/ directory
>  > does not sound too appealing).  I guess I'd be most interested in how
>  > to fix (1) first.
> 
> If we have to move stuff again, we could do drivers/cpufreq/x86/ etc..
> Even if we do that though, you really want to fix that userspace, because
> you're right that "load everything and see what sticks" is fragile,
> and pure luck that it ever did the right thing.

not sure why this bug landed here finally, it was clearly an
overlook in the Debian startup script and it's only specific to Debian.

The "load everything" part was not for cpu drivers but for governors
and helpers that used to sit into drivers/cpufreq alone.
The cpu driver loading part is fairly complex (or yes, messy as you say)
and not too dissimilar than the one from fedora.

-- 
mattia
:wq!
