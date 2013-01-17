From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] powernow-k8: Add a kconfig dependency on acpi-cpufreq
Date: Thu, 17 Jan 2013 23:12:40 +0100
Message-ID: <20130117221240.GA4122@pd.tnic>
References: <1357780161-30581-1-git-send-email-Aravind.Gopalakrishnan@amd.com>
 <7359167.GTsCEtNASI@vostro.rjw.lan>
 <20130117141758.GA3386@pd.tnic>
 <3845649.nP3d3cdOBJ@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358460764; bh=CD6dVMKeiy5u8yqjzK6J5y0LCeX/dFg7igZT1hd/6gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=AM8/B9/fknVIyT7gygkvyqzdePCMrJ68xa169W
	g6QW5yUUtklAFTZXYi/2AkC44AcWpSIk1PzcmAN4atNkdTmf4bbQAv10HRXTC3vbM/P
	9zuWai/ivcgl3S+UVBAkptujFEeK6NDFvNTfJoeHGP9JNOcGcqqJmdWFPRDK1LVhF8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358460764; bh=CD6dVMKeiy5u8yqjzK6J5y0LCeX/dFg7igZT1hd/6gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=AM8/B9/fknVIyT7gygkvyqzdePCMrJ68xa169W
	g6QW5yUUtklAFTZXYi/2AkC44AcWpSIk1PzcmAN4atNkdTmf4bbQAv10HRXTC3vbM/P
	9zuWai/ivcgl3S+UVBAkptujFEeK6NDFvNTfJoeHGP9JNOcGcqqJmdWFPRDK1LVhF8=
Content-Disposition: inline
In-Reply-To: <3845649.nP3d3cdOBJ@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: "Gopalakrishnan, Aravind" <Aravind.Gopalakrishnan@amd.com>, Andre Przywara <andre@andrep.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas <linuxuser330250@gmx.net>

On Thu, Jan 17, 2013 at 11:10:56PM +0100, Rafael J. Wysocki wrote:
> 3.7+ I suppose?

Yes, the patch adding the request_module() call went in in 3.7:

$ git tag --contains e1f0b8e9b04a2
v3.7
v3.7-rc1
v3.7-rc2
v3.7-rc3
v3.7-rc4
v3.7-rc5
v3.7-rc6
v3.7-rc7
v3.7-rc8
v3.7.1
v3.8-rc1
v3.8-rc2
v3.8-rc3
$

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
