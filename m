From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/6 v4] cpufreq: tolerate inexact values when collecting
 stats
Date: Tue, 13 Nov 2012 17:24:49 +0100
Message-ID: <20121113162449.GE9327@x1.osrc.amd.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
 <1352313166-28980-1-git-send-email-mark.langsdorf@calxeda.com>
 <1352313166-28980-4-git-send-email-mark.langsdorf@calxeda.com>
 <20121111163821.GA21635@x1.osrc.amd.com>
 <50A12565.4070701@calxeda.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1352823873; bh=rTHuQUGOsPnnAvFVdZbwbAebaAXGbv/xeugYGg3OHEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=JesVRV/L5l+14JIcysVmm0ZmfYNSpq/3gjz9P6
	946zu57GhZyFdiC6kQV/8PsQhnG5gMEDuQinsGDotwKfmnL3d6blPbdbE3hAasWZBWw
	tzkyA1TbebHMnWvMOwPdWd/BAx8AX86ZKVWeK8Ju60K0Q7DFxmGkxf9xLFn4X8jT1Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1352823872; bh=rTHuQUGOsPnnAvFVdZbwbAebaAXGbv/xeugYGg3OHEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=o75zrgi0N2VFavBwd13cyvh9OnE7MSxmJ4OQ2d
	4DNK7k4uNkSeA/HMxNmYQheMcNc5+89JGYTqbQL/mZ+CyaOl1ICvLpAJENu6mIHIayp
	eourA5G4tIqF8nNoHrrkpJ7t3N0RQalmnFjOEnC6vH5EfjMTKRRl/TQQ1QHs4qWcCY=
Content-Disposition: inline
In-Reply-To: <50A12565.4070701@calxeda.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@gmail.com>

On Mon, Nov 12, 2012 at 10:35:49AM -0600, Mark Langsdorf wrote:
> The function is buried pretty deep in the cpufreq_stat code. It didn't
> seem appropriate to make it a function pointer as part of struct
> cpufreq_driver.

Right, what's cpufreq-speak for

	if (Calxeda)
		shift by 10

?

Better yet, add a flag or a bitfield called "minimize_jitter" or similar
and set it only on your hardware...

Thanks.

-- 
Regards/Gruss,
Boris.
