From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] cpufreq: ARM big LITTLE: Add generic cpufreq driver
	and its DT glue
Date: Wed, 6 Mar 2013 17:25:17 +0000
Message-ID: <20130306172517.GT17833@n2100.arm.linux.org.uk>
References: <f20e3c5e822c4bd28a3b71264d73143cc1f850b0.1362458878.git.viresh.kumar@linaro.org> <20130305105251.GL17833@n2100.arm.linux.org.uk> <CAKohponef2XNN2i8Dn7aBnzcdJeCmuGrmN3HjaBUZvBHkNSLKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=tjYgD0KnvXPM8zuxQYwmoG4qx07GhO210NbCiNs93lQ=;
	b=Oo7uQOoVpOYEh/RzmC6dTFlqrdCORnqVvZ84V57BgS1qBiyR+unBajlp/ocWofhky/FeSnE/BYXrb0nSPNWJepEhrk4EiMDFSXfrL7TG/1o6zeyuZNKCoz22yQPzjgUbXdPE/zS+8QK29vpfNM5zw+0GxlHEOYSko/qnn+b0Fgs=;
Content-Disposition: inline
In-Reply-To: <CAKohponef2XNN2i8Dn7aBnzcdJeCmuGrmN3HjaBUZvBHkNSLKQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, Steve.Bannister@arm.com, linux-pm@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>, Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, robin.randhawa@arm.com, linux-arm-kernel@lists.infradead.org, mark.hambleton@broadcom.com, linaro-kernel@lists.linaro.org, charles.garcia-tobin@arm.com

On Wed, Mar 06, 2013 at 12:38:36AM +0800, Viresh Kumar wrote:
> So how does below fix look to you?

Much better, but I think you want a better device name than just "clusterN".

Also, please get rid of that "default n" - n is the default default default
default default default.... there's no need to specify it. :)
