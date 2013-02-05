From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Tue, 5 Feb 2013 12:32:42 +0100
Message-ID: <20130205113242.GF4827@pd.tnic>
References: <20130204165057.GH13909@pd.tnic>
 <CAOh2x==fyfYwz+eXmPhBJTE+_q_fHyx2drXrM789XvCfEqPBUQ@mail.gmail.com>
 <20130205091532.GA4827@pd.tnic>
 <CAKohpo=6q+Bcgq0Re=3SXM6zwub5N=vJBO=sTeEgZZ9byFK7=g@mail.gmail.com>
 <20130205102721.GB4827@pd.tnic>
 <CAKohpo=_Qq-_Aqy7nZD+f28-B7DY8ioQ5fe8bYKTe64A0RXeGw@mail.gmail.com>
 <20130205110407.GC4827@pd.tnic>
 <CAKohponiiVO_P2EDDTUHeoo7j3FG-ELtP8oLwfdEQ3HkgOS77g@mail.gmail.com>
 <20130205111918.GD4827@pd.tnic>
 <CAKohpomUsDr0YJmOxjymcAAJnfOxKfzxGL4iHuif1qCAvy0OYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360063964; bh=/kklbv7jGngzzDRnUQg0goCDXgFXuDAlLYLJDboqwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=kdJY6FOW3FjnyNLZV6itZUyI2KLKzIUAHP3/+I
	mzN57zewpGY72s3ewc/F3ggt8fW6jhuCj11VQd2RDiQNvy6F1beZJmu/bG+JmwFIHA1
	tr5W1gxJj2UkGvT9rDj8YHb04mgLyMlOGXZelm4aoc27e99eo9yyxb38ux341tEpZg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360063963; bh=/kklbv7jGngzzDRnUQg0goCDXgFXuDAlLYLJDboqwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=UX5jWi9sNo3mznxO34jKcOaR82Ez6yFzKPt+T8
	NymJBsz6UtIpm14UxEQzZD2RRJEes3HpW7X1UL6VRPpm/mhFzRZ0cuIlaUqsICkNAXq
	JWBl7BjQRJPLF5pIspi7q/fZe8McqijIXKxDjxja1yD3LcdPLo/Fz0BSOF6XmIbcrw=
Content-Disposition: inline
In-Reply-To: <CAKohpomUsDr0YJmOxjymcAAJnfOxKfzxGL4iHuif1qCAvy0OYA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, Charles Garcia-Tobin <Charles.Garcia-Tobin@arm.com>

On Tue, Feb 05, 2013 at 04:56:03PM +0530, Viresh Kumar wrote:
> Just some kind of indication from platform driver is required about
> how/where it wants its governor directory to be present.

The indication is this:

config CPUFREQ_PLATFORM_DRIVER_X
        ...
        select CPUFREQ_MULTIPLE_POLICIES

You really need to slow down and really look at what I'm proposing.

> And the variable suits more here.

And this variable means nothing on other systems so why add it in the
first place?

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
