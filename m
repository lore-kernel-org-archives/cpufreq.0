From: Pieter De Wit <pieter@insync.za.net>
Subject: Detection of HyperThreading
Date: Mon, 2 May 2011 15:47:30 +1200 (NZST)
Message-ID: <alpine.DEB.2.02.1105021542530.2853@eragon.insync.za.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=insync.za.net;
	s=21027; t=1304308051;
	bh=pIryQuEX46l3DwXwnqj5/1QwOHZm5jKRruo8cdaMtdw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=m7KT2xmJXAk+lhkVejAQB6JUPqTAHcc7nhllhj33Pqs6OgT7Ez5UJ2rcjFc5jhvMD
	 24kjrzpJRrq0WJbXtKtUKeJkxlFEoTxj8aTKBBfYCzZXmwU8JI3hymtGYb2hgXXTVp
	 tRuHat6dHdOg96ZgFJz780Z+M7B4gxRYtJ+I51cE=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hello Guys,

I found something quite weird over the weekend. I have a few machines that 
claim they have HT (using cat /proc/cpuinfo). These machines doesn't 
really support HT (both with the number of threads and Intel's website)

I was wondering:

a) Is this the right list to send to (Sorry if not)

and

b) How is the HT flag detected ?

CPU's like the Core2 Duo E6300 doesn't have HT, but yet the flag is 
displayed ? See http://ark.intel.com/Product.aspx?id=27248 for info. I can 
send a dump of /proc/cpuinfo later from home.

Thanks,

Pieter
