From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 0/2] CPUFreq / Ondemand update
Date: Wed, 29 Feb 2012 17:54:40 +0900
Message-ID: <1330505682-4794-1-git-send-email-myungjoo.ham@samsung.com>
References: <1329897815-15871-1-git-send-email-myungjoo.ham@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1329897815-15871-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Jean Pihet <j-pihet@ti.com>, markgross <markgross@thegnar.org>, kyungmin.park@samsung.com, myungjoo.ham@gmail.com

1. A new sampling rate should be effective immediately at update.

2. The sampling rate may be controlled through QoS requests.

Summory of changes since v1 patchset (RFC)
- Style changes
- Avoid the possiblity that a destroyed mutex may be used with QoS request.


MyungJoo Ham (2):
  CPUfreq ondemand: update sampling rate without waiting for next
    sampling
  CPUfreq ondemand: handle QoS request on DVFS response latency

 drivers/cpufreq/cpufreq_ondemand.c |  166 ++++++++++++++++++++++++++++++++++-
 1 files changed, 161 insertions(+), 5 deletions(-)

-- 
1.7.4.1
