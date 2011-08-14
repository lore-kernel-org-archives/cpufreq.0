From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [BUG?] Moving drivers to drivers/cpufreq/ causes all to be loaded
Date: Sun, 14 Aug 2011 12:01:24 -0500
Message-ID: <20110814170124.GC12747@elie.gateway.2wire.net>
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
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=kc65iu031PCnPxrI9b3T4fervH0CI9KfXiXNxbUspEM=;
        b=CBhmnD1tboxhvLVndUR/KynaK+j9Qi4G+WhOK+EfWMVDyWIXhSCiLM3RRV5yi1QDVG
         Q0qEzgfuvlL314KqfSWX2fNdKG5hjsQUfrKBIi2mNjdYvvrUVnfTM77sXg8NGe9H337L
         iIFiUsbAzaXvi6QwZYfv0ZlH5Qzi2/LX3VqNw=
Content-Disposition: inline
In-Reply-To: <20110813211142.GA1536@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Mattia Dongili <malattia@debian.org>, Kay Sievers <kay.sievers@vrfy.org>

(-cc: ARM/etc people; +cc: Kay)

Dave Jones wrote:

> If we have to move stuff again, we could do drivers/cpufreq/x86/ etc..

Unfortunately the old script used "find", not "ls", so that wouldn't
work. :/

> What we used to do in Fedora grew more and more complex over time.
> Here's the last incarnation: http://fpaste.org/uvDb/

The main difference from Debian seems to be that this script loads the
module corresponding to the chosen governor, while Debian's init
script loads all governor modules early (using a heuristic I would
like to avoid that involves running "find" to list them) and chooses
the governor to use later.

> In an ideal world, we'd auto-load the right module on a hotplug event
> from a cpu, but we're not there yet. I believe Kay is working on that.

Yes, that is what I was hoping for.  Are there patches to test?

The comment at
http://thread.gmane.org/gmane.linux.kernel/796450/focus=796874 also
looks promising.

Thanks much for the help,
Jonathan
