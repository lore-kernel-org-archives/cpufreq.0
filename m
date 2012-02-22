From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [RFC PATCH 0/2] CPUFreq / Ondemand update
Date: Wed, 22 Feb 2012 17:03:33 +0900
Message-ID: <1329897815-15871-1-git-send-email-myungjoo.ham@samsung.com>
References: <CAJ0PZbSODSJvV-_Gje9Hm9Ek22Z9m+PAcsf071OCmAOtsnKzyg@mail.gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CAJ0PZbSODSJvV-_Gje9Hm9Ek22Z9m+PAcsf071OCmAOtsnKzyg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Jean Pihet <j-pihet@ti.com>, markgross <markgross@thegnar.org>, kyungmin.park@samsung.com, myungjoo.ham@gmail.com

1. A new sampling rate should be effective immediately at update.

2. The sampling rate may be controlled through QoS requests.


MyungJoo Ham (2):
  CPUfreq ondemand: update sampling rate without waiting for next
    sampling
  CPUfreq ondemand: handle QoS request on DVFS response latency

 drivers/cpufreq/cpufreq_ondemand.c |  150 ++++++++++++++++++++++++++++++++++-
 1 files changed, 145 insertions(+), 5 deletions(-)

-- 
1.7.4.1

