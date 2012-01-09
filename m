From: mark gross <markgross@thegnar.org>
Subject: Re: [linux-pm] [PATCH 3/6] cpufreq: Export user_policy min/max
Date: Mon, 9 Jan 2012 06:18:31 -0800
Message-ID: <20120109141831.GB11463@mgross-G62>
References: <20120106153320.GF12530@mgross-G62>
 <20120106.212926.720061341805749024.apm@brigitte.kvy.fi>
 <20120107035328.GC3119@mgross-G62>
 <20120107.104723.1386766787855536005.apm@brigitte.kvy.fi>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=Z/OPL0gYzgzJ5KBagSiIwbNYh/wiNC7mBbW/gEHm3wk=;
        b=Y7RI2mKcf4Bd2+TD22qed/X79QcOG0O4pDkm4H8cqJwQ20ZlZyNcSiIvKuxXE80D2u
         K3toHuKH6mUs8ijfblEMm5dLQzTMEw7wLauwYk80NXQHeN2vKUsbJEZR0fvsoVpkl1md
         K6ODniOmR578+p20AuPeC4RMSFOoJp8AhLtY0=
Content-Disposition: inline
In-Reply-To: <20120107.104723.1386766787855536005.apm@brigitte.kvy.fi>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ananaza@iki.fi
Cc: markgross@thegnar.org, linux-pm@lists.linux-foundation.org, cpufreq@vger.kernel.org

On Sat, Jan 07, 2012 at 10:47:23AM +0200, Antti P Miettinen wrote:
> From: mark gross <markgross@thegnar.org>
> > Maybe I'm missing something but cpufreq already has ABI for setting
> > upper and lower bounds for frequencies.
> > 
> > /sys/devices/system/cpu/cpu0/cpufreq/[scaling_min_freq,
> > scaling_max_freq]
> > 
> > --mark
> 
> Yes, and the patch just adds two read-only files,
> /sys/devices/system/cpu/cpu?/cpufreq/policy_{min,max}_freq:

I didn't catch the read-only part of that.  maybe thats not a big deal

--mark
> 
> +show_one(policy_min_freq, user_policy.min);
> +show_one(policy_max_freq, user_policy.max);
> 
> to show the user_policy.min/max in addition to the
> policy->min/max. This is related to patch 4 which changes the
> scaling_{min,max}_freq store function to store the received value to
> user_policy instead of the enforced value. Related in turn to the
> restoring of the policy values when PM QoS constraints get lifted. The
> purpose of patch 3 is to allow inspecting the requested min/max in
> addition to the enforced min/max.
> 
> 	--Antti
> 
> Adding cpufreq to cc, previous comments for context:
> 
> http://thread.gmane.org/gmane.linux.power-management.general/26532
> 
> _______________________________________________
> linux-pm mailing list
> linux-pm@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-pm
