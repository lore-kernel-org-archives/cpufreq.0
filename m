From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Mon, 21 Jul 2014 06:19:34 +0000
Message-ID: <bug-72361-12968-t7qXuCDID9@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

ArLi Weng <arliweng@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |VERIFIED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #12 from ArLi Weng <arliweng@gmail.com> ---
(In reply to Collin from comment #10)
> Hi, is this the same bug from freedesktop.org? I've been working with the
> second patch that fixes the problem with MSI motherboards that only have
> APUs.
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=72921
> 
> Let us know if it works for you guys too! Also, how does this get pushed
> upstream?

confirm, work fine @ kernel 3.15.5.

hope i can see next release so i don't need manual compile.. or as module
parameters

-- 
You are receiving this mail because:
You are the assignee for the bug.
