From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60587] Only two p-states visible on AMD FX-8350
Date: Wed, 24 Jul 2013 02:32:21 +0000
Message-ID: <bug-60587-12968-q9PZoZ24TX@https.bugzilla.kernel.org/>
References: <bug-60587-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60587-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60587

--- Comment #3 from Aaron Lu <aaron.lu@intel.com> ---
From the ACPI table, control method _PSS only contains two performance state
4GHZ and 1.4GHZ, so I don't see a problem here. My guess is that, there might
be a vendor driver for performance control under Windows?

-- 
You are receiving this mail because:
You are the assignee for the bug.
