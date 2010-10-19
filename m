From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 09:40:43 GMT
Message-ID: <201010190940.o9J9eh3t030433@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #24 from Thomas Renninger <trenn@suse.de>  2010-10-19 09:40:32 ---
Would it help if I provided you with some ACPI information? What do you need?
acpidump output for now. Need to look up the addresses of dynamic tables.
Possibly you can look it up yourself.
Do:
acpixtract acpidump
iasl -d *.dat
grep -i load *.dsl
You may see something like that then:
SSDT.dsl:                    Load (IST0, HI0)
SSDT.dsl:                    Load (CST0, HC0)
SSDT.dsl:                Load (CST1, HC1)
SSDT.dsl:                Load (IST1, HI1)
Which is the address/length of the dynamically loaded table.
On this system you there is:
OperationRegion (IST0, SystemMemory, DerefOf (Index (SSDT, One)), DerefOf
(Index (SSDT, 0x02)))
and
Name (SSDT, Package (0x0C)
        {
            "CPU0IST ",
            0xAADA3918,
            0x000003FB,
            "APIST   ",
            0xAADA2A98,
            0x00000303,
            "CPU0CST ",
            0xAADA1018,
            0x000008A9,
            "APCST   ",
            0xAADA0D98,
            0x00000119
        })

These are the names/address/length of the tables you need to extract manually
with
acpidump --addr 0xAADA3918 --length 0x000003FB >CPU0IST.dat
acpidump --addr 0xAADA2A98 --length 0x00000303 >CPU0CST.dat

They possibly can already be found there:
/sys/firmware/acpi/tables/
not sure.

But you could also just give my two patches a try and show us:
cat /sys/devices/system/cpu/cpu*/cpufreq/shared_type
if it shows CPUFREQ_SHARED_TYPE_ALL  (2)
it's worth to the boot param mentioned in comment #21

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
