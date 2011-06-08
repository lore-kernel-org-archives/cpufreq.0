From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq powernow-k8: Remove firmware warning in zero
 transition latency case
Date: Wed, 8 Jun 2011 09:55:27 -0400
Message-ID: <20110608135526.GA6420@redhat.com>
References: <201106081007.14264.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201106081007.14264.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

On Wed, Jun 08, 2011 at 10:07:13AM +0200, Thomas Renninger wrote:
 > AMD's BKDG documents that a zero transition latency should get passed for
 > several recent CPU models.
 > -> This isn't a firmware bug.

but the test you're deleting is checking for family < 11h. 
My reading of that comment is that it _was_ a firmware bug on earlier systems.

	Dave 
