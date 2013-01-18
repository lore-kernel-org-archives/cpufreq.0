From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] drivers/cpufreq: Warn user when powernow-k8 tries to
 fall back to acpi-cpufreq and it is unavailable.
Date: Fri, 18 Jan 2013 20:00:21 +0100
Message-ID: <20130118190021.GD4062@pd.tnic>
References: <1357780161-30581-1-git-send-email-Aravind.Gopalakrishnan@amd.com>
 <20130111144940.GB21882@liondog.tnic>
 <20130111165054.GD10751@liondog.tnic>
 <4923C2DE085EEB4FAB1D375DD09D0BA6100CF170@sausexdag04.amd.com>
 <20130117115436.GA3853@pd.tnic>
 <20130118162347.GA31499@srcf.ucam.org>
 <20130118170755.GB4062@pd.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358535626; bh=K7Y77b9c3DbOW53uOmSNudDbQVaxRnCXA5/UQxdhOWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=W3IWHr+maSn3CWESElYJ/3xMnaNoP2mT4M453B
	Wb/fLPvBXHVronsqaFN7ABCZzy2+FuK4iWGaJ8fllsDlsRGFJmR16F9bxRK0njdneHB
	DaMC27qFADzbEuTRQlCVcNmOm+UG2wxXSQBi7IetHbwySIL6jxKlITskv9S1s/ppkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358535625; bh=K7Y77b9c3DbOW53uOmSNudDbQVaxRnCXA5/UQxdhOWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=FugoWICMsrU7bsnY/1rxPlRpn79nMT6pTWs46E
	58IBcByTnBb3sgPeRSn+JrJRAHcQHl4REfMUrySrucwgajtGDz9YQ2X8/9zvuWte8up
	TYA/k721HLXljdXAWiXkekms9UHjqDX3IvxNBas8RgQvShekhMoPsRKLAj8FMwy2HU=
Content-Disposition: inline
In-Reply-To: <20130118170755.GB4062@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Gopalakrishnan, Aravind" <Aravind.Gopalakrishnan@amd.com>, "rjw@sisk.pl" <rjw@sisk.pl>, Andre Przywara <andre@andrep.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas <linuxuser330250@gmx.net>

On Fri, Jan 18, 2013 at 06:07:55PM +0100, Borislav Petkov wrote:
> > Just flip the link order? It's only the way it is because in the
> > past we wanted to try hardware-specific drivers before more generic
> > ones, and I don't think that's a concern in this case now.
>
> Yeah, I heard that the acpi-idle and intel-idle drivers do that and also
> heard that it was a hack. It doesn't look too ugly IMHO:
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=2671717265ae6e720a9ba5f13fbec3a718983b65

Haha, this turns into one of those chicken-or-the-egg problems:

From <drivers/cpufreq/Makefile>:

##################################################################################
# x86 drivers.
# Link order matters. K8 is preferred to ACPI because of firmware bugs in early
# K8 systems.
...

Great. :(

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
