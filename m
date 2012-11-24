From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/6 v4] cpufreq: add support for Calxeda ECX-1000 (highbank)
Date: Sat, 24 Nov 2012 11:07:17 +0100
Message-ID: <4773267.Os4fuEpixz@vostro.rjw.lan>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1352313166-28980-1-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1352313166-28980-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Hi Mark,

On Wednesday, November 07, 2012 12:32:40 PM Mark Langsdorf wrote:
> This patch series adds cpufreq support for the Calxeda
> ECX-1000 (highbank) SoCs. The driver is based on the 
> cpufreq-cpu0 driver. Because of the unique way that 
> highbank uses the EnergyCore Management Engine to manage
> voltages, it was not possible to use the cpufreq-cpu0 driver.

Please address the reviewers' comments for patches [3-4/6] and [6/6].

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
