From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73421] intel/p_state Does not increase into Turbo Boost states
 and does not display all governors. i5-3201M
Date: Thu, 03 Apr 2014 15:14:41 +0000
Message-ID: <bug-73421-12968-WRbIJQFBj4@https.bugzilla.kernel.org/>
References: <bug-73421-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73421-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D73421

--- Comment #4 from =C3=81lvaro Castillo <netsys@fedoraproject.org> ---
This command reports:


rdmsr -a 0x199
rdmsr: invalid option -- 'a'
Usage: rdmsr [options] regno
  --help         -h  Print this help
  --version      -V  Print current version
  --hexadecimal  -x  Hexadecimal output (lower case)
  --capital-hex  -X  Hexadecimal output (upper case)
  --decimal      -d  Signed decimal output
  --unsigned     -u  Unsigned decimal output
  --octal        -o  Octal output
  --c-language   -c  Format output as a C language constant
  --zero-pad     -0  Output leading zeroes
  --raw          -r  Raw binary output
  --processor #  -p  Select processor number (default 0)
  --bitfield h:l -f  Output bits [h:l] only

msr-tools-1.1.2-8.fc20.x86_64

I don't understand this.

How can an Intel Core 2 duo more older than my Intel i5 processor It's =
passed 3
generations of releases built. Be more powerful than it?

Some conclusions:
- 1=C2=BA: Intel is lying. I should as good citizen I am report them fo=
r fraud.
- 2=C2=BA: Intel_pstate does not working correctly.

--=20
You are receiving this mail because:
You are the assignee for the bug.