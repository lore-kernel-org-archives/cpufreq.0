From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Tue, 5 Feb 2013 10:15:32 +0100
Message-ID: <20130205091532.GA4827@pd.tnic>
References: <20130204130403.GD13909@pd.tnic>
 <CAKohpokuFC5gnTFcD3+RH3p5XaW8vBtyfq+Kej=d2J8tERdmoQ@mail.gmail.com>
 <20130204133648.GE13909@pd.tnic>
 <CAKohpo=aLnhM0Op_32ohWZK5eG5nT7iK0OktBe+8ygOQW7zUqQ@mail.gmail.com>
 <20130204140908.GC15452@pd.tnic>
 <CAKohpokowK6ybYd8aDUdfFYsnzoc5VAKsuPSkfxoDqJ3k+FwGA@mail.gmail.com>
 <20130204150511.GF13909@pd.tnic>
 <CAKohpokt0xtsj1eQDMw6JgvQVp4rgFyU-vUrtuuF+0jjOVNHRQ@mail.gmail.com>
 <20130204165057.GH13909@pd.tnic>
 <CAOh2x==fyfYwz+eXmPhBJTE+_q_fHyx2drXrM789XvCfEqPBUQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360055734; bh=m3KOsUmnE/T+UhYMD/+7alMCZAYbPTTrnpPocoMbsOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ZZewrnLDvv03+OBJz6e+b9C2cJqug2lSJ9EyxC
	b018CnANnpIkeHbYkmsMqoxo5EGE1X+J9nTvYSJGcd1F+5l4lKV4r7KCo5d524W5iJH
	tnR5GwvsMy2bMAGjmOZX9PBet1Jg/WJYEuzuSZ0n9SdEL/LjZQYRAyPVmzb2reZpaA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360055733; bh=m3KOsUmnE/T+UhYMD/+7alMCZAYbPTTrnpPocoMbsOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=J2KFbdGBRcx/drbVV0SyH8u8Zo2AN/BXnMcT78
	miavMsK5eBM3Xu90nKuY0lNUN7gc+XZNsR3yp5FBPuC9awAGTIGnkkpPQMPWymWrnx3
	KvnQCk5C3oElYk9vI+5Kh1uDbVlmX9nz50Z5IckIX+PF+t4Qx5EgDb7jJLtRCi7XwM=
Content-Disposition: inline
In-Reply-To: <CAOh2x==fyfYwz+eXmPhBJTE+_q_fHyx2drXrM789XvCfEqPBUQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com

On Tue, Feb 05, 2013 at 12:50:31PM +0530, Viresh Kumar wrote:
> > I think this is cleaner but whatever - I don't care that much. My
> > only strong concern is that this thing should be a Kconfig option and
> > optional for arches where it doesn't apply.
> 
> Your concern is: we don't want to fix userspace for existing platforms
> where we have just a single cluster and so struct policy in the system.

No, as I said so many times already and you're unwilling to understand
it: multiple policies support in cpufreq should be optional and
selectable in Kconfig so that systems which don't need that, don't
have to see or use it. It is yet another feature which doesn't apply
universally so we make such features optional. Like the rest of the
gazillion things in the kernel already.

The existing sysfs layout cannot be changed because you're breaking
userspace and we don't do that. It is that simple.

Concerning adding new sysfs entries, I told you to make it as easy as
possible and as sensible as possible, dictated by the use cases. If you
can't come up with some, then talk to the people who are going to use
your design and ask them what makes sense the most.

*Then* write the code.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
