From: Borislav Petkov <bp@alien8.de>
Subject: Re: [3.14-rc3] possible regression Haswell runs only at 770Mhz with
 powersave governor
Date: Thu, 20 Feb 2014 16:01:01 +0100
Message-ID: <20140220150101.GA9557@pd.tnic>
References: <53061204.7080700@gmx.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1392908463; bh=Fl4SW1zmooha7+bmmJpqmvTKu4I1Z/99bNUn+LAIa6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=B/2kVeDyDMgMqoc0u8bt9bE3f6oDdEziL70T3W
	nC7BhP9gG2nOJNKszAoZ94seWIPFCHLtUwJNzILTyVgHGSQQR90YbBy5X8T0FQYZPUg
	FLLT9uZwfAVQ09on9buWcW8ezXu40pH9Qh2z7CcNMS5MRFo/B/vJrRa/YZUj+MZgJY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1392908463; bh=Fl4SW1zmooha7+bmmJpqmvTKu4I1Z/99bNUn+LAIa6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=B/2kVeDyDMgMqoc0u8bt9bE3f6oDdEziL70T3W
	nC7BhP9gG2nOJNKszAoZ94seWIPFCHLtUwJNzILTyVgHGSQQR90YbBy5X8T0FQYZPUg
	FLLT9uZwfAVQ09on9buWcW8ezXu40pH9Qh2z7CcNMS5MRFo/B/vJrRa/YZUj+MZgJY=
Content-Disposition: inline
In-Reply-To: <53061204.7080700@gmx.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Otto Meier <gf435@gmx.net>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Add lists to CC.

On Thu, Feb 20, 2014 at 03:32:36PM +0100, Otto Meier wrote:
> Hello,
> 
> My System which runs with older kernels up to 3.13.3
> fine on my i3-4330 with 3.5 Ghz and governor powersave.
> and pstate driver.
> 
> With kernel 3.14-rc3 and Governor powersave it runs
> only at 770Mhz and never switches to higher Freq. on load.
> Even compiling a kernel with make -j4   does not change freq.
> 
> With governor performance  it switches to 3.5 Ghz and stays
> there.
> 
> Any Idea how to fix this?
> 
> Best regards

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
