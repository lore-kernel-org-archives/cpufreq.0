From: Dave Jones <davej@redhat.com>
Subject: CPUFREQ maintainence.
Date: Mon, 30 Apr 2012 10:06:45 -0400
Message-ID: <20120430140645.GB12583@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

This last few releases I've been more of a hindrance than help to getting
some of the patches merged upstream, so due to my lack of time, I'm considering
removing myself as maintainer, and having patches routed as such instead...

ARM -> Russell/relevant ARM subtree maintainers
x86 driver patches -> x86@vger.kernel.org
(All the other archs currently supported already go through the arch trees mips/sparc etc)

The core doesn't see a huge amount of change these days, I figure patches for
that can just go to lkml & Linus/Andrew like any other subsystem.

comments?

	Dave
