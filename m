From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Mon, 13 Feb 2012 14:26:07 -0800
Message-ID: <20120213222607.GA19465@kroah.com>
References: <1329000256.325.48.camel@deadeye>
 <201202130010.57492.trenn@suse.de>
 <4F3866D4.9060209@zytor.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=QjEBD8z5H83fCXwz3OkHkV6EaZs=; b=Gq0TCiIeFSnOrQxO/cLYSZ1YXmsJ
	i/LH/rBeMNX8n2gwGPc9Py0REwNQLLyFhqhZbY/Shoj38KqdR6zWZQ+WpyL1Z3+Y
	Ieof9z6R7pfGUqj9S3CdogvSzqhSW5Ol88L3DxIqkEyAk4YPowRcGhFVVePEp0bg
	J7WBBXCiEw4fiZM=
Content-Disposition: inline
In-Reply-To: <4F3866D4.9060209@zytor.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Renninger <trenn@suse.de>, Ben Hutchings <ben@decadent.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Sun, Feb 12, 2012 at 05:26:44PM -0800, H. Peter Anvin wrote:
> On 02/12/2012 03:10 PM, Thomas Renninger wrote:
> > On Saturday 11 February 2012 23:44:16 Ben Hutchings wrote:
> >> This series fixes a number of apparent bugs in the recent changes to
> >> enable auto-loading by x86 CPU ID.
> > 
> > These all look correct.
> > I should have spotted the intel_idle modifications myself.
> > Good catch(es).
> > 
> > Greg: I expect these should get queued in your driver-core-next branch?
> > 
> 
> Either that or we can carry them in -tip as x86 patches, since there
> isn't a pending conflict this time.

Ok, if there are no dependancies on the driver-core-next tree, please
take this through the x86 trees.

thanks,

greg k-h
