From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Tue, 5 Feb 2013 12:19:18 +0100
Message-ID: <20130205111918.GD4827@pd.tnic>
References: <20130204150511.GF13909@pd.tnic>
 <CAKohpokt0xtsj1eQDMw6JgvQVp4rgFyU-vUrtuuF+0jjOVNHRQ@mail.gmail.com>
 <20130204165057.GH13909@pd.tnic>
 <CAOh2x==fyfYwz+eXmPhBJTE+_q_fHyx2drXrM789XvCfEqPBUQ@mail.gmail.com>
 <20130205091532.GA4827@pd.tnic>
 <CAKohpo=6q+Bcgq0Re=3SXM6zwub5N=vJBO=sTeEgZZ9byFK7=g@mail.gmail.com>
 <20130205102721.GB4827@pd.tnic>
 <CAKohpo=_Qq-_Aqy7nZD+f28-B7DY8ioQ5fe8bYKTe64A0RXeGw@mail.gmail.com>
 <20130205110407.GC4827@pd.tnic>
 <CAKohponiiVO_P2EDDTUHeoo7j3FG-ELtP8oLwfdEQ3HkgOS77g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360063159; bh=44NuxxdXrbOoic0kjU8Fjr8bGve/UcfCAFeHXMTx33A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=XsKy6d0eQkF8FPOQwU0gk8m3J0CAJQY1avoGFX
	+4SbZg2xtbazt7uvcZ8izS9t5wLguSZevGdToWN4s6GdyLY9QEeafh1wSm1xDltndhI
	ehbSqD0V+EaBvS3C9hjJt8JSgBKzGIJWcPihRqPplLQxjieXrV5Ccfs7iImP7zlo0Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360063159; bh=44NuxxdXrbOoic0kjU8Fjr8bGve/UcfCAFeHXMTx33A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=XsKy6d0eQkF8FPOQwU0gk8m3J0CAJQY1avoGFX
	+4SbZg2xtbazt7uvcZ8izS9t5wLguSZevGdToWN4s6GdyLY9QEeafh1wSm1xDltndhI
	ehbSqD0V+EaBvS3C9hjJt8JSgBKzGIJWcPihRqPplLQxjieXrV5Ccfs7iImP7zlo0Q=
Content-Disposition: inline
In-Reply-To: <CAKohponiiVO_P2EDDTUHeoo7j3FG-ELtP8oLwfdEQ3HkgOS77g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, Charles Garcia-Tobin <Charles.Garcia-Tobin@arm.com>

On Tue, Feb 05, 2013 at 04:42:23PM +0530, Viresh Kumar wrote:
> Tricky part is the name of this routine: add_additional_sysfs_entries().

Now you're just being silly - this is just an example how to do it. If
you want me to do it for ya, you need to send me your monthly salary.

> And so, keeping that additional variable looks a better solution.

Yeah, I don't think you understand me at all. :(

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
