From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC V1 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Fri, 16 Dec 2011 08:24:23 +0000
Message-ID: <20111216082423.GM14542@n2100.arm.linux.org.uk>
References: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org> <4EEA415F.8030901@calxeda.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=3LXbbpWYPgxQP7cr8trdiI291AhKI52/f6X8O7zcuZM=;
	b=RCb6nZNB0DlM/JDhmnInI2kcp9j3NdZn+Mq9QJOIUYnlSbKu7mf4/1a8cTthvXGZXTlWOSrh0BSFKrJCPNHkjfjsuf8LER43BfdN4tus/AWbzjP08mT8wWNFtMasQMF3dI08LZC9O5JtQVgwS9ZUF2LesyFs/DRnCJbSif5x4Es=;
Content-Disposition: inline
In-Reply-To: <4EEA415F.8030901@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: Richard Zhao <richard.zhao@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "eric.miao@linaro.org" <eric.miao@linaro.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>

On Thu, Dec 15, 2011 at 12:50:07PM -0600, Mark Langsdorf wrote:
> I'd prefer to see clk_get90 replaced with of_clk_get() and
> get_this_cpu_node() from the clk-cpufreq driver by Jamie Iles that
> I resubmitted yesterday.

Why isn't of_clk_get() hidden inside clk_get() ?
