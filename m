From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Sun, 12 Feb 2012 22:43:08 -0800
Message-ID: <20120213064308.GB28617@kroah.com>
References: <1329000256.325.48.camel@deadeye>
 <201202130010.57492.trenn@suse.de>
 <20120213021847.GA25382@kroah.com>
 <4F387CCF.7040604@zytor.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=nkNT3ibnwa23kY1um9Jcyg7ElAA=; b=R+oLkDmzbqmsfLkDkF9qnEHG5Yvh
	HiNB+zwPodAKK3TSbK7iZyvd/ulP4wpfQ8TBNfoal7kvtOnX7NbYbTZ9krwT+nDW
	4Dv3BxU9lZoEdZkY23VC/OnVhen8XWpSMDY5lISKnLIZp8CKHx9vFH5Z3Q78vlM6
	VTzzsn1eO4RzAeM=
Content-Disposition: inline
In-Reply-To: <4F387CCF.7040604@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Renninger <trenn@suse.de>, Ben Hutchings <ben@decadent.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Sun, Feb 12, 2012 at 07:00:31PM -0800, H. Peter Anvin wrote:
> On 02/12/2012 06:18 PM, Greg KH wrote:
> > I can take them, unless the x86 maintainers object and want to take them
> > through their tree.
> 
> Why don't we take them... I think it makes more sense long-term.

Ok, but for some reason I thought they depended on the patches already
in my driver-core-next tree.  If that's not the case, please feel free
to take them through yours.

greg k-h
