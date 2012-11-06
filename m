From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: [PATCH 0/6 v3] cpufreq: add support for Calxeda ECX-1000 (highbank)
Date: Tue,  6 Nov 2012 14:18:02 -0600
Message-ID: <1352233089-22586-1-git-send-email-mark.langsdorf@calxeda.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, mark.langsdorf@calxeda.com

This patch series adds cpufreq support for the Calxeda
ECX-1000 (highbank) SoCs. The driver is based on the 
cpufreq-cpu0 driver. Because of the unique way that 
highbank uses the EnergyCore Management Engine to manage
voltages, it was not possible to use the cpufreq-cpu0 driver.

--Mark Langsdorf


