From: Mathieu Roy <yeupou@gnu.org>
Subject: cpufreq --hwfreq / --freq and overclocking
Date: Tue, 7 Aug 2012 13:09:27 +0200
Message-ID: <201208071309.27662@bender.stalag13.ici>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hello,

Is there any way to get the actual real hardware CPU frequency in the case of an overclocked CPU?

Running at max, I get 
  # cpufreq-info --hwfreq
3000000
  # cpufreq-info --freq
3000000

However, dmidecode shows, according to BIOS settings:
	Version: AMD Athlon(tm) II X4 640 Processor
	External Clock: 230 MHz
	Max Speed: 3700 MHz
	Current Speed: 3450 MHz

Which frequency value is the correct one? I assume cpufreq does not override the BIOS overclocking settings (external clock at 230 instead of 200, hence the CPU at 3450 instead of 3000), so is there any way for cpufreq to adjust and report correct values?

(PS : I googled a bit around and found nothing conclusive)
(PPS : Please add me in Cc:)

Regards,

-- 
Mathieu Roy
