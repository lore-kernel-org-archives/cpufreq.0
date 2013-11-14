From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 63081] ignore_nice_load changes from one to zero after
 suspend2ram
Date: Thu, 14 Nov 2013 19:03:32 +0000
Message-ID: <bug-63081-12968-csgqK1eM2o@https.bugzilla.kernel.org/>
References: <bug-63081-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-63081-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=63081

--- Comment #10 from Rainer Kaluscha <rainer.kaluscha@web.de> ---
Created attachment 114741
  --> https://bugzilla.kernel.org/attachment.cgi?id=114741&action=edit
grep . /sys/devices/system/cpu/cpu*/cpufreq/*

-- 
You are receiving this mail because:
You are the assignee for the bug.
