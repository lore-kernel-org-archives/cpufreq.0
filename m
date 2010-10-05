From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 3/5] cpupowerutils: Move utils/cpuid.h to lib/cpuid.h
Date: Tue, 5 Oct 2010 14:38:35 +0200
Message-ID: <201010051438.35793.trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <1286281394-14699-4-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-4-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: linux@dominikbrodowski.net

On Tuesday 05 October 2010 14:23:12 Thomas Renninger wrote:
> So that utils/*.c code can make use of this as well.
Should be:
So that lib/*.c code can make use of this as well.

    Thomas
