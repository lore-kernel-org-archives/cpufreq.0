From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Fri, 11 Apr 2014 03:40:27 +0000
Message-ID: <bug-73781-12968-9d8ubt8Q5d@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

--- Comment #3 from Viresh Kumar <viresh.kumar@linaro.org> ---
I wanted you to revert all three and then test it :)

Okay, I have reverted them for you now, let me know if it works.
Otherwise you have to do a git bisect, we aren't left with much options :)

git://git.linaro.org/people/viresh.kumar/linux.git for-kato

--
viresh

-- 
You are receiving this mail because:
You are the assignee for the bug.
