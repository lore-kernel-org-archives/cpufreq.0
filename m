From: James Cloos <cloos@jhcloos.com>
Subject: Re: [PATCH 0/6] cpufreq: Add sampling window to enhance ondemand governor power efficiency
Date: Fri, 24 Dec 2010 23:24:48 -0500
Message-ID: <m3zkrueaxj.fsf@jhcloos.com>
References: <1293085424-18212-1-git-send-email-youquan.song@intel.com>
	<20101223110020.GC18363@comet.dominikbrodowski.net>
	<20101223173402.GA3821@redhat.com>
	<20101223205148.GB6441@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jhcloos.com;
	s=eagle; t=1293252418;
	bh=VCwGqA63wdbSsG3B+ds4cauvL5obyb+2/d5P553Qrb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	b=h6ItQx0qqlD3evTvZeScbCKLJz89eX+IFxXtMNOt603ipXTsGx12fgI0UZC7/LoBL
	 gpgZgTtb/58UcgaH2vQ70rmZUadYEoxuR6iveEgzO7GA8dm898nEuLN5zquzfjefg5
	 csXe6+NxAX5sSTbLgxf4pk/lHvlZQWbwVk/eKucg=
In-Reply-To: <20101223205148.GB6441@comet.dominikbrodowski.net> (Dominik
	Brodowski's message of "Thu, 23 Dec 2010 21:51:48 +0100")
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Dave Jones <davej@redhat.com>, Youquan Song <youquan.song@intel.com>, cpufreq@vger.kernel.org, venki@google.com, arjan@linux.intel.com, lenb@kernel.org, suresh.b.siddha@intel.com, kent.liu@intel.com, chaohong.guo@intel.com, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Youquan Song <youquan.song@linux.intel.com>

>>>>> "DB" == Dominik Brodowski <linux@dominikbrodowski.net> writes:

DB> AFAICS, we have two in-kernel dynamic frequency scaling governors, one of
DB> which doesn't seem to get much usage (conservative)...

Isn't conservative the recommended choice for AMD processors?

Or has that changed?

-JimC
-- 
James Cloos <cloos@jhcloos.com>         OpenPGP: 1024D/ED7DAEA6
