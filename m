From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [PATCH 0/6 v3] cpufreq: add support for Calxeda ECX-1000 (highbank)
Date: Wed, 07 Nov 2012 12:11:00 -0600
Message-ID: <509AA434.80702@calxeda.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1352233089-22586-1-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1352233089-22586-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 11/06/2012 02:18 PM, Mark Langsdorf wrote:
> This patch series adds cpufreq support for the Calxeda
> ECX-1000 (highbank) SoCs. The driver is based on the 
> cpufreq-cpu0 driver. Because of the unique way that 
> highbank uses the EnergyCore Management Engine to manage
> voltages, it was not possible to use the cpufreq-cpu0 driver.

I accidentally sent out old versions of the patches. Please ignore the
v3 series and look at the v4 instead.

--Mark Langsdorf

