From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Sun, 12 Feb 2012 18:18:47 -0800
Message-ID: <20120213021847.GA25382@kroah.com>
References: <1329000256.325.48.camel@deadeye>
 <201202130010.57492.trenn@suse.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=wMHdbhHPP1749h4jt4oRysxVjes=; b=EdcdIJe1D1hrtRZZcj9WaDsqrVA6
	PGX8KRhU64mU0heiQuI6ckncaWhb5st9NmP2W7hMiB+XYugikwgTKu33Kgpm96AG
	CjXtWWc//8sl9vPoxkbY0k1ptonGAH4KDHRkqs7RubJrtx2xPZPozXwjyOT8kr5s
	6Om1BxHhAtwm5lw=
Content-Disposition: inline
In-Reply-To: <201202130010.57492.trenn@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Mon, Feb 13, 2012 at 12:10:56AM +0100, Thomas Renninger wrote:
> On Saturday 11 February 2012 23:44:16 Ben Hutchings wrote:
> > This series fixes a number of apparent bugs in the recent changes to
> > enable auto-loading by x86 CPU ID.
> 
> These all look correct.
> I should have spotted the intel_idle modifications myself.
> Good catch(es).
> 
> Greg: I expect these should get queued in your driver-core-next branch?

I can take them, unless the x86 maintainers object and want to take them
through their tree.

thanks,

greg k-h
