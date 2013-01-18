From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] drivers/cpufreq: Warn user when powernow-k8 tries to
 fall back to acpi-cpufreq and it is unavailable.
Date: Fri, 18 Jan 2013 18:07:55 +0100
Message-ID: <20130118170755.GB4062@pd.tnic>
References: <1357780161-30581-1-git-send-email-Aravind.Gopalakrishnan@amd.com>
 <20130111144940.GB21882@liondog.tnic>
 <20130111165054.GD10751@liondog.tnic>
 <4923C2DE085EEB4FAB1D375DD09D0BA6100CF170@sausexdag04.amd.com>
 <20130117115436.GA3853@pd.tnic>
 <20130118162347.GA31499@srcf.ucam.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358528880; bh=Jme8oP6Z7pKxTGnNIuuXGfnmdeGJngTOLiRfe3qPSF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=UKWLu4u9v3lOCkHQMfGUPIETbrs+Hv/7lkVY3l
	eeaHz0e0dC5ozUJ6+2lq/SIcJrXQkS7AQ+ZtQBmJ7ORTJRySbE6jkwe9OXMtugnrw5w
	5qlCvXjOt14dvdOal3tgGGBTvjGQ0BlqYlOgNLvjFC3h8WQuIR9bDpV68M/coEn/Yw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358528879; bh=Jme8oP6Z7pKxTGnNIuuXGfnmdeGJngTOLiRfe3qPSF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=fEQt3w4EH4/eBxxXyugAG4YEMTDHUXUP7w4/dn
	zWXovwIqyFOTnxoBW9p+x6XMdqKlUOCGjPCdfUp90eadVswbcs96z3AF3BkwxSuaE5w
	oXiZI+gK8C6cWcI4P9n9SINOiIdL6EHTCqRKyfl/hLXarjon1PtnmmZVRkzsqEvyhA=
Content-Disposition: inline
In-Reply-To: <20130118162347.GA31499@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Gopalakrishnan, Aravind" <Aravind.Gopalakrishnan@amd.com>, "rjw@sisk.pl" <rjw@sisk.pl>, Andre Przywara <andre@andrep.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas <linuxuser330250@gmx.net>

On Fri, Jan 18, 2013 at 04:23:47PM +0000, Matthew Garrett wrote:
> On Thu, Jan 17, 2013 at 12:54:37PM +0100, Borislav Petkov wrote:
> 
> > So, handoff to acpi-cpufreq still has some issues. When both are
> > built-in, the module_init functions turn into normal initcalls and
> > in that case, they're executed in link order and it can happen that
> > powernowk8_init() runs before acpi_cpufreq_init().
> 
> Just flip the link order? It's only the way it is because in the past we 
> wanted to try hardware-specific drivers before more generic ones, and I 
> don't think that's a concern in this case now.

Yeah, I heard that the acpi-idle and intel-idle drivers do that and also
heard that it was a hack. It doesn't look too ugly IMHO:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=2671717265ae6e720a9ba5f13fbec3a718983b65

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
