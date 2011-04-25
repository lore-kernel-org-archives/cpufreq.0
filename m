From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] cpufrequtils sysfs: increase MAX_LINE_LEN
Date: Mon, 25 Apr 2011 10:11:15 +0200
Message-ID: <20110425081115.GA27025@isilmar-3.linta.de>
References: <1303579989-17454-1-git-send-email-rvasiyarov@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1303579989-17454-1-git-send-email-rvasiyarov@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman Vasiyarov <rvasiyarov@gmail.com>
Cc: cpufreq@vger.kernel.org

On Sat, Apr 23, 2011 at 09:33:09PM +0400, Roman Vasiyarov wrote:
> larger sysfs data (>255 bytes) was truncated and thus used improperly

Thanks, patch looks good and useful. However, could you add a
Signed-off-by - line, please, as per Documentation/SubmittingPatches ?

Thanks & best,
	Dominik
