From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V3 1/2] cpufreq: ondemand: allow custom
 powersave_bias_target handler to be registered
Date: Tue, 2 Apr 2013 21:24:17 +0200
Message-ID: <20130402192417.GD17675@pd.tnic>
References: <1364926304-1799-1-git-send-email-jacob.shin@amd.com>
 <1364926304-1799-2-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364930659; bh=udsp5ptfy3jARKkjXP4/2pArTAuxHAYmok7erxOJT/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=rkgFsMPZ87uVuGXG58t8m8d3ZOq9rRYRe7iVG+
	bl3HBJmXaTlsPV7ydyE9sHgc3gSjIPmNr1WKyViHZFXwImactLzXrsmC/fWBNEnc+Wn
	bbK2K67S/5BFVt7RnxV/Co4eZ5Su4mYlGIP4E+e8XS5aVq9tl1g3EJNe2VKqnqkKfs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364930659; bh=udsp5ptfy3jARKkjXP4/2pArTAuxHAYmok7erxOJT/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=rkgFsMPZ87uVuGXG58t8m8d3ZOq9rRYRe7iVG+
	bl3HBJmXaTlsPV7ydyE9sHgc3gSjIPmNr1WKyViHZFXwImactLzXrsmC/fWBNEnc+Wn
	bbK2K67S/5BFVt7RnxV/Co4eZ5Su4mYlGIP4E+e8XS5aVq9tl1g3EJNe2VKqnqkKfs=
Content-Disposition: inline
In-Reply-To: <1364926304-1799-2-git-send-email-jacob.shin@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Renninger <trenn@suse.de>

On Tue, Apr 02, 2013 at 01:11:43PM -0500, Jacob Shin wrote:
> This allows for another [arch specific] driver to hook into existing
> powersave bias function of the ondemand governor. i.e. This allows AMD
> specific powersave bias function (in a separate AMD specific driver)
> to aid ondemand governor's frequency transition deicisions.
> 
> Signed-off-by: Jacob Shin <jacob.shin@amd.com>

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
